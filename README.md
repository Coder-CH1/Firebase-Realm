# Firebase-Realm

The Framework -
This project was created using a UIkit Framework of programmatic ui, I designed with classes, properties, methods, extensions, reusable views, functions.

The Designs -
The figma design comprises of four screens and a bottom sheet. The icons and colors used was gotten from the figma design.

The Design Pattern -
The project was created using MVVM structuring of design patterns.

Dependencies - 
I used cocoapod to install Firebase and Realm to access it's features that will be used in the project.

Ui Testing -
I tested the login screen using the Xcode XCTest framework.

Device Mode - 
The dark mode features is enabled in the project.

Post Manager - 
I created a file manager named Post Manager class that manages the post in the app and also interacts with the firestore database, This Post Manager have two properties which are an instance of Firestore and a collection name, the collection name property represents the name of the collection in which the posts are stored.

The Post Manager have different methods for adding, fetching post or data from the Firestore Database.

Firstly, I will be explaining the first method which is addPostToFirestore method which takes in various parameters representing the post's properties, apart from the post properties, the parameter also includes a collection name, a document id, this collection name and a document id tallies with the one in the Firebase console. Inside the method it creates a reference to the document using the provided collection name and document id, it also creates a dictionary of key/values of data containing the post's properties and their corresponding values, finally it calls the setData method(this method is inbuilt) on the document reference to save the data in the Firestore, if there is an error, it calls the completion closure with the error object, or it calls the completion closure with nil to indicate successful execution.

Secondly, I also created another method, this method is called fetchPosts, it fetches posts from the Firestore Database, it takes a completion closure as a parameter (@escaping) which is called with an array of Post(I have created the Post model which comprises of different properties) objects once the posts are fetched. I created a postRef variable which specifies and retrieves the collections and calls the getDocument method(This is also an inbuilt method like the setData specified above) to fetch the document, this method comes with two conditions of either a querySnapshot or an error,

A querySnapshot is an object that contains the results of a query. It contains an array of QueryDocumentSnapshot objects where each represents a single document that matches the query criteria in the Firestore. The main basic features of a querySnapshot is that it iterates or loops an array of documents in the Firestore.

As stated above, from the getDocuments which fetches the documents, if their is an error, it prints the error message and calls the completion closure with an empty array, otherwise it loops over the retrieved documents, extracts the data using the keys and creates a post object.

Finally, it appends the post array and calls the completion closure with the populated post array.


PostViewModel - 
This acts as an intermediary between the UI and the Post manager class. It contains a reference to an instance of Post Manager and provides a method addPostToFirestore to add a post to Firestore. Just like I explained previously, this method takes in various parameters representing the post properties.
The reason I created this PostViewModel is to help in organizing and exposing the required methods from Post manager to the UI.

UI -
From the HomeViewController which contains the properties and methods, the PostViewModel will be called in the viewcontroller and also initialize the post property values, and also the post Manager will be called too in the Viewcontroller.


Generally the features of the app design is created for users to post, and other users can comment, like, save, share in the post, the users of the app can also chat privately in the app.
