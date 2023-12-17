# Flutter VIPER architecture

## Overview

https://blog.personal-factory.com/content/images/2020/05/----------2020-05-31-16.31.30.png

As shown in the image above, VIPER stands for View, Interactor, Presenter, Entity and Router. This an architecture where applications are built according to the principle of single responsibility. VIPER architecture is based on the Clean Architecture (hereafter CA), and you can naturally follow the CA with building according to the VIPER architecture.  

### View

View is responsible for the UI of the screen.  

### Presenter

The Presenter acts as a bridge between the View and the Interactor. The Presenter receives input from the View, such as data acquisition, updating and deletion, and calls the desired Interactor. It also receives result data from the called Interactor and passes it on to the View. In other words, the Presenter here is a combination of the Controller and Presenter in CA.  
(Note that the vocabulary of Presenter is also used in CA, but the role of the Presenter in the VIPER architecture is slightly different, as described in the line above.)  

### Interactor

Interactor only performs business logic related to Entity. Interactor is independent of View, Presenter and has no knowledge of them. It is required to be based on the principle of dependency inversion.  

### Entity

Entity is an immutable data model, even if programming languages, frameworks and tools change.  

### Router

The Router is responsible for the logic of the screen transitions.  

---

## Directory structure reflecting the VIPER architecture

```text
lib/
├── entities/
├── infra/
│   └── gateways/
│       └── {entity_name}/ /* Generate a directory for each Entity. ex: authentication/ */
│           ├── concrete_repository.dart /* put the actual process communicating with the API server. */
│           └── i_concrete_repository.dart
├── interactors/
│   └── {entity_name}/ /* Generate a directory for each Entity. ex: authentication/ */
│       ├── concrete_interactor.dart /* ex: sign_in_interactor.dart */
│       └── i_concrete_use_case.dart /* ex: i_sign_in_use_case.dart */
├── presenters/
│   └── {entity_name}/   /* ex: authentication/ */
│       └── concrete_presenter.dart /* ex: authentication */
└── view/
└── routers/
```

## Example in the "Sign in" use case

After pressing the "Sign In" button on the sign-in page (view/pages/sign_in_page.dart), then Presenter `AuthenticationPresenter.signIn()` is called.  

`sign_in_page.dart`
```text
ElevatedButton(
  key: const ValueKey('SignInButton'),
  onPressed: () {
    authenticationPresenter.signIn(emailController.text, passwordController.text);
  },
  style: ElevatedButton.styleFrom(
    fixedSize: const Size.fromWidth(double.maxFinite),
  ),
  child: const Text('Sign In'),
),
```

Within `AuthenticationPresenter.signIn()` the SignInInteractor, i.e. the `Interactor` corresponding to the "Sign in" use case, is called and executed.  

`authentication_presenter.dart`
```text
Future<void> signIn(String email, String password) async {
  try {
    SignInResponse response =
        await _bus.handle(SignInRequest(email, password));

    state = state.copyWith(
      user: response.user,
    );

    if (state.isSignedIn) {
      _myPageRouter.go();
    }
  } catch (e) {
    throw DataHandlingException(message: 'Failed to sign in.');
  }
}
```

Note that `InteractorBus` is used to call Interactor from the Presenter side, the InteractorBus class is a self-made class. The implementation is described in `lib/interactors/interactor_bus.dart`. This class is intended to separate the screen from the logic and facilitate test execution, and has a role similar to that of ServiceContainer in Laravel.  
The idea of a one-to-one correspondence between a use case and a single API is assumed, so that if a Request can be identified, the corresponding Interactor and Response are automatically determined. Therefore, when a Request is passed as an argument to the `handle()` method, the InteractorBus executes the Interactor registered by the `register()` method and returns a Response as its return value.  
In the SignInInteractor, the request is sent to the API server through the `signIn()` method of the Authentication Repository and the response is obtained. The specific means of API communication is confined to the Repository; the Interactor is only responsible for obtaining Entity information and passing it to the Presenter. In addition, the API response can be mocked on the test by reversing Repository dependencies through DI.  

`sign_in_interactor.dart`
```text
Future<SignInResponse> invoke(SignInRequest request) async {
  try {
    User user = await authenticationRepository.signIn(
      email: request.email,
      password: request.password,
    );

    return SignInResponse(
      user: user,
    );
  } catch (e) {
    return SignInResponse(
      user: null
    );
  }
}
```

If the sign-in is successful, the Router described in the Presenter takes the user to My Page. :tada:  

---

## (Optional) To put real-world use cases into code

In practice, is it possible to experience this effect only from the sign-in use case description? The answer is no, and my colleague could not get it. Another example is then presented through the 'Get note list' use case, which will often be used in the notes application that often appears in the tutorials.  

In View it is called like this.  

```
final NoteListPresenter = ref.read(NoteListPresenterProvider.presenter.notifier);
final NoteList = NoteListPresenter.get();
```

In Presenter it is called like this.  

```
class NoteListPresenterProvider {
  NoteListPresenterProvider._();

  static final presenter = StateNotifierProvider<NoteListPresenter, NoteList>((ref) {
    return NoteListPresenter(ref.read(interactorBusProvider));
  });
}

class NoteListPresenter extends StateNotifier<NoteList> {
  final InteractorBus _bus;

  NoteListPresenter(this._bus) : super(NoteList(list: []));

  Future<NoteList> get() async {
    // write the code to get note list following the sign in use case.
  }
}
```

Prepare a list of 'note list' as Entity.  
The 'Note' itself is also provided as an Entity, although it is omitted.  

```
@freezed
abstract class NoteList with _$NoteList {
  const NoteList._();

  factory NoteList({
    List<Note> list,
  }) = _NoteList;
}
```

If the API communication mechanism is limited to this use case, there will be no problem if an appropriate API server that performs basic GET communication is prepared and called according to the API definition created in advance. However, it is often the case that an API server has not yet been prepared. In such cases, use `InteractorBus` to handle dummy data.  
Prepare dummy data regarding the memo list as follows, which is returned when calling InteractorBus in the Presenter.  

`interactor_bus_builder.dart`
```
class GetNoteListInteractor implements IGetNoteListUseCase {
  @override
  Future<NoteListResponse> invoke(NoteListRequest request) async {
    return NoteListResponse(
      list: [
        Note(id: 1, title: 'This is the title.', description: 'Lorem Ipsum.'),
        Note(id: 2, title: 'This is the title.', description: 'Lorem Ipsum.'),
        ...
      ]
    );
  }
}
```

---

## The problem

We are forcibly using Riverpod's provider functionality to separate Presenter and Router from View. If you have a better way, please let @yasuy0shi know via issue or fork!
