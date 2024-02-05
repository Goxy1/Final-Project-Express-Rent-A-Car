package DB;

public class Car {

    private int id;
    private String CarName;
    private String CarAge;
    private int Kilometers;
    private String Engine;
    private String CarText;
    private String CarDescription;

    public Car() {
    }

    public Car(int id, String carName, String carAge, int kilometers, String engine, String carText, String carDescription) {
        this.id = id;
        CarName = carName;
        CarAge = carAge;
        Kilometers = kilometers;
        Engine = engine;
        CarText = carText;
        CarDescription = carDescription;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCarName() {
        return CarName;
    }

    public void setCarName(String carName) {
        CarName = carName;
    }

    public String getCarAge() {
        return CarAge;
    }

    public void setCarAge(String carAge) {
        CarAge = carAge;
    }

    public int getKilometers() {
        return Kilometers;
    }

    public void setKilometers(int kilometers) {
        Kilometers = kilometers;
    }

    public String getEngine() {
        return Engine;
    }

    public void setEngine(String engine) {
        Engine = engine;
    }

    public String getCarText() {
        return CarText;
    }

    public void setCarText(String carText) {
        CarText = carText;
    }

    public String getCarDescription() {
        return CarDescription;
    }

    public void setCarDescription(String carDescription) {
        CarDescription = carDescription;
    }
}
