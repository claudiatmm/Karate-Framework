function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    appUrl: 'https://demoqa.com',
    resourceBasePath: 'src/test/resources' // Adjust the path as needed
//    userName: '<storeUserName>'
  };
  if (karate.env == 'env') {
    // 'callSingle' is guaranteed to run only once even across all threads
    var result = karate.callSingle('classpath:com.example/helper/PostRequestHelper.feature', config);
    // and it sets a variable called 'authInfo' used in headers-single.feature
    config.authInfo = { authUser: result.user, authPass: result.pass, authId: result.userIdd };
  }

  else if (env == 'e2e') {
    // customize
  }
  return config;
}