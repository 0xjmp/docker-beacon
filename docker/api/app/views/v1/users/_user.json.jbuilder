json.(user, :id, :visible)
json.zones user.zones, partial: 'v1/zones/zone', as: :zone