Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['901837906577041'], ENV['8cfe12b1db0452a435034b865003f1ed']
end
