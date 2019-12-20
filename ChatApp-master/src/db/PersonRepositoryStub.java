package db;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import domain.Person;
import domain.Role;

public class PersonRepositoryStub implements PersonRepository{
	private Map<String, Person> persons = new HashMap<String, Person>();
	
	public PersonRepositoryStub () {
		Person administrator = new Person("bib@ucll.be", "t", "Bib", "Liothekaris", "M", 56, Role.BIB);
		Person jan = new Person("jan@ucll.be", "t", "Jan", "Janssens", "M", 34, Role.LID);
		Person an = new Person("an@ucll.be", "t", "An", "Cornelissen", "V", 45, Role.LID);
		Person arnaud = new Person("arnaud@ucll.be", "Test123", "Arnaud", "Vanspauwen", "M", 20, Role.LID);
		Person wouter = new Person("wouter@ucll.be", "Test123", "Wouter", "Thielemans", "M", 20, Role.LID);
		add(administrator);
		add(jan);
		add(an);
		add(arnaud);
		add(wouter);

		jan.addFriend(an);
		jan.addFriend(arnaud);
		an.addFriend(jan);
		an.addFriend(wouter);
		wouter.addFriend(arnaud);
		arnaud.addFriend(wouter);
	}
	
	public Person get(String personId){
		if(personId == null){
			throw new IllegalArgumentException("No id given");
		}
		return persons.get(personId);
	}
	
	public List<Person> getAll(){
		return new ArrayList<Person>(persons.values());	
	}

	public void add(Person person){
		if(person == null){
			throw new IllegalArgumentException("No person given");
		}
		if (persons.containsKey(person.getUserId())) {
			throw new IllegalArgumentException("User already exists");
		}
		persons.put(person.getUserId(), person);
	}
	
	public void update(Person person){
		if(person == null){
			throw new IllegalArgumentException("No person given");
		}
		persons.put(person.getUserId(), person);
	}

    @Override
    public Person getByName(String name) {
        if (name == null) {
            throw new IllegalArgumentException("No name given");
        }
        name = name.toLowerCase();
        for (Person person : persons.values()) {
            if (person.getFirstName().toLowerCase().equals(name) || person.getLastName().toLowerCase().equals(name) || person.getUserId().toLowerCase().equals(name)) {
                return person;
            }
        }
        throw new IllegalArgumentException("No person found");
    }

    public void delete(String personId){
		if(personId == null){
			throw new IllegalArgumentException("No id given");
		}
		persons.remove(personId);
	}
	
	public Person getAuthenticatedUser(String email, String password) {
		Person person = get(email);
		
		if (person != null && person.isCorrectPassword(password)) {
			return person;
		}
		else {
			return null;
		}
	}
}
