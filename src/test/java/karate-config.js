function fn() {
  var env = karate.env; // get system property 'karate.env' e.g. "mvn test -Dkarate.env=prod"
  karate.log('karate.env system property was:', env);

  if (!env) {
    karate.log('Using default config, just for demo');
  }

  //default config just for demo
  var config = {
    baseUrl: 'https://api.weatherbit.io/v2.0',
    apiKey: 'efbd9a1c42e74ab7b10ad764d6639690'              //Move to a secure key-vault or a masked ci config
  }

  //override required configs based on envs
  if (env == 'prod') {
    config.baseUrl = 'https://api.weatherbit.io/v2.0';
    config.apiKey = 'efbd9a1c42e74ab7b10ad764d6639690';     //Move to a secure key-vault or a masked ci config
  } else if (env == 'stg') {
    // customize stg env specific configs here
  }

  // timeout if api doesn't respond within 10 seconds
  karate.configure('connectTimeout', 10000);
  karate.configure('readTimeout', 10000);

  return config;
}
