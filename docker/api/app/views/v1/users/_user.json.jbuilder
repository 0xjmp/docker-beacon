json.(user, :id, :visible)
json.zones user.zones, partial: 'v1/zones/zone', as: :zone
json.identities user.identities, partial: 'v1/identities/identity', as: :identity