module Mongoid
  module Spatial
    class Polygon

      include Mongoid::Fields::Serializable

      def deserialize(object)
        points = object.map do |pair|
          RGeo::Geographic.spherical_factory.point *pair
        end
        ring = RGeo::Geographic.spherical_factory.linear_ring points
        RGeo::Geographic.spherical_factory.polygon ring
      end

      def serialize(object)
        object #.flatten
      end


    end
  end
end
