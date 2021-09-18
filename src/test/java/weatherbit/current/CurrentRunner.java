package weatherbit.current;
import com.intuit.karate.junit5.Karate;

class CurrentRunner {

  @Karate.Test
  Karate testCurrentWeatherByLatLon() {
    return Karate.run("CurrentByLatLon").relativeTo(getClass());
  }

  @Karate.Test
  Karate testCurrentWeatherByPostCode() {
    return Karate.run("CurrentByPostCode").relativeTo(getClass());
  }

}