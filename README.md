aight so this reame includes a reflection about this lab sesh

The first difference is app state is more global, shared across the application, and needs robust management
while ephemeral state is more local to a single widget and typically managed with the widget's internal State object
(basically app state is for the entire app, meanwhile ephemeral state is only for singular widget)

The second difference is the lifespan, App State lifespan is basically the same as the app itself
meanwhile ephemeral has a shorter lifespan and last only as long as the widget is mounted and visible in the widget tree

the third (and final) difference is the responsibility, app state is responsible for managing data that's being shared and accessed by multiple widgets
meanwhile ephemeral is responsible for managing data that is local to a particular widget or UI component.
