package DB;

public class Reservation {
    private String ID;
    private String FirstName;
    private String LastName;
    private String emailAddress;
    private String dateOfBirth;
    private String checkInDate;
    private String checkOutDate;
    private String typeOfLocation;
    private String carName;

    public Reservation(String ID, String firstName, String lastName, String emailAddress, String dateOfBirth, String checkInDate, String checkOutDate, String typeOfLocation, String carName) {
        this.ID = ID;
        FirstName = firstName;
        LastName = lastName;
        this.emailAddress = emailAddress;
        this.dateOfBirth = dateOfBirth;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.typeOfLocation = typeOfLocation;
        this.carName = carName;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String firstName) {
        FirstName = firstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String lastName) {
        LastName = lastName;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(String checkInDate) {
        this.checkInDate = checkInDate;
    }

    public String getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(String checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public String getTypeOfLocation() {
        return typeOfLocation;
    }

    public void setTypeOfLocation(String typeOfLocation) {
        this.typeOfLocation = typeOfLocation;
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName;
    }
}
