# Adaptor_design_pattern

Adaptor design pattern [structural] base on GoF book

## Getting Started

Adaptor is a structural design pattern, also known as wrapper.
The purpose of this pattern is convert the interface of a class into another interface clients expect.Adaptor lets classes work together that couldn't otherwise because of incompatible interfaces.

The pattern is useful when you want to ensure that some particular piece of code in your software could be reused by wrapping it with an adapter and exposing an interface to it.This lets the future implementations in your code depend on Adapter interfaces, rather than concrete classes directly.

##Applicability

- The adapter design pattern could and should! be used when the interface of the third-party library does not match the one you are currently using in your application. 
- When calling external data sources, APIs and you want to wrap and separate the data conversion code from the primary business logic in your program. 
- The pattern is useful when you want to use multiple implementation (adaptees) that have similar functionality but use different APIs

##Implementation

Let’s say, in the Flutter application we want to collect our 
contacts from two different sources. Unfortunately, these two 
sources provide the contacts in two different formats — JSON and
XML. Also, we want to create a Flutter widget that represents 
this information in a list. However, to make the widget 
universal, it cannot be tied to a specific data format (JSON or 
XML), so it accepts these contacts as a list of Contact objects 
and does not know anything about how to parse JSON or XML strings
to the required data structure. So we have two incompatible 
interfaces — our UI component (widget), which expects a list of 
Contact objects, and two APIs, which return contacts’ information
in two different formats. As you could have guessed, we will use 
the Adapter design pattern to solve this problem.

First of all, there are two APIs: JsonContactsApi and XmlContactsApi.
These two APIs have different methods to return contacts information in two different formats — JSON and XML.
Hence, two different adapters should be created to convert the specific contacts’ representation to the required format which is needed in the ContactsSection component (widget) — list of Contact objects
To unify the contract (interface) of adapters, IContactsAdapter abstract class is created which requires implementing (override) the getContacts() method in all the implementations of this abstract class.
JsonContactsAdapter implements the IContactsAdapter, uses the JsonContactsApi to retrieve contacts information as a JSON string, then parses it to a list of Contact objects and returns it via getContacts() method.
Accordingly, XmlContactsAdapter is implemented in the same manner, but it receives the data from XmlContactsApi in XML format.
