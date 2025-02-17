enum NetworkExceptionType {
  backend, //For errors sent from the backend
  unauthorized, //Unauthorized vs Forbidden: https://stackoverflow.com/questions/3297048/403-forbidden-vs-401-unauthorized-http-responses
  forbidden,
  notFound, //404 vs 405: https://stackoverflow.com/questions/63613258/rest-web-service-error-code-should-be-404-or-405 ,405 vs 501: https://sip-implementors.cs.columbia.narkive.com/GjYcZlgE/405-vs-501
  conflict,
  internal,
  serviceUnavailable, //Common causes are a server that is down for maintenance or that is overloaded
  timeOut,
  noInternet,
  unknown,
  success,
  noContent,
  badRequest,
  connectionTimeout,
  cancel,
  revieveTimeout,
  sendTimeout,
  noInternetConnection,
  badCertificate,
}
