Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, '75ttcluq216xq4', 'CJQHaCdZyt9j7fhR'
  provider :facebook, '196086400588426', '846d2e23b662b0a0654646e9ec5a36a6'
  provider :gplus, '100410198803-161m4as6licbqrp5vj12r3mflr1fkq58.apps.googleusercontent.com','bclSVyGGX71inVExpyu-EU9j'
end