Meteor.startup ->
  # Server-wise this is handled by Accounts.onCreateUser in server/users.coffee
  AccountsEntry.config
    logo: false
    privacyUrl: false
    termsUrl: false
    homeRoute: '/'
    dashboardRoute: '/'
    profileRoute: 'profile'
    passwordSignupFields: 'EMAIL_ONLY'
    showSignupCode: false
    showOtherLoginServices: true
    extraSignUpFields: [
      field: 'name'
      label: 'Your name'
      placeholder: 'Your name'
      type: 'text'
      required: true
    ,
      field: 'phone'
      label: 'Your phone number'
      placeholder: 'Your phone number'
      type: 'text'
      required: false
    ]
    fluidLayout: false
    useContainer: true
    signInAfterRegistration: true
    emailVerificationPendingRoute: '/verification-pending'
    showSpinner: true
    spinnerOptions:
      color: '#000'
      top: '80%'
  return
