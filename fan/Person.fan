using xml

** Describes a person, corporation, or similar entity.
** 
** @see The [Person]`http://tools.ietf.org/html/rfc4287#section-3.2` Construct
class Person {
	
	** *(Required)*
	** A human-readable name for the person.
	Str		name
	
	** *(Optional)*
	** A home page for the person.
	Uri?	uri
	
	** *(Optional)*
	** An email address for the person.
	Uri?	email

	** Creates a 'Person' with the required fields.
	new make(Str name) {
		this.name = name
	}
	
	** Creates a Person element with the given element name.
	virtual XElem toXml(Str elementName) {
		person := XElem(elementName)
		
		person.add(XElem("name") {
			XText(this.name),
		})

		if (uri != null)
			person.add(XElem("uri") {
				XText(this.uri.encode),
			})
		
		if (email != null)
			person.add(XElem("email") {
				XText(email.encode),
			})
		
		return person
	}
}

