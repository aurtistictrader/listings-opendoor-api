class ListingSerializer < ActiveModel::Serializer
  attributes :type, :features

  def type
    'FeatureCollection'
  end

  def features
    custom_features = []

    if !(object.is_a?(Listing))
      object.each do |listing|
        custom_listing = {}
        custom_listing[:type] = 'Feature'
        custom_listing[:geometry] = {
            :type => 'Point',
            :coordinates => [listing.lat, listing.lng]
        }
        # custom_listing[:properties] = listing.attributes
        custom_listing[:properties] = {
            :id => listing.id.to_s,
            :price => listing.price,
            :street => listing.street,
            :bedrooms => listing.bedrooms,
            :bathrooms => listing.bathrooms,
            :sq_ft => listing.sq_ft,
        }

        custom_features.push(custom_listing)
      end
    else
      custom_listing = {}
      custom_listing[:type] = 'Feature'
      custom_listing[:geometry] = {
          :type => 'Point',
          :coordinates => [object.lat, object.lng]
      }

      custom_listing[:properties] = {
          :id => object.id.to_s,
          :price => object.price,
          :street => object.street,
          :bedrooms => object.bedrooms,
          :bathrooms => object.bathrooms,
          :sq_ft => object.sq_ft,
      }

      custom_features.push(custom_listing)
    end

    custom_features
  end
end