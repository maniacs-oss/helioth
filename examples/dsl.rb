roles do
  user :beta, :standard
  instance :beta, :standard, :critical
  feature :disabled, :beta, :pre_release, :production
end

## Set authorization for feature based on user and instance role
relations do
  feature :disabled

  feature :beta do
    instance :beta
    user :beta
  end

  feature :pre_release do
    instance :beta, :standard
    user :beta
  end

  feature :production do
    instance :beta, :standard, :critical
    user :beta, :standard
  end
end

## Declare features
features do
  feature :no_name do
    status :disabled
  end

  feature :tutoring do
    status :pre_release

    actions :search, :send do
      status :pre_release
      locales :fr
    end

    actions :index do
      status :production
    end
  end

  feature :social_learning do
    status :beta
    locales :fr, :en
  end
end
