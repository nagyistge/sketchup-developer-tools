# Copyright:: Copyright 2012 Trimble Navigation Ltd.
# License:: Apache License version 2.0
# Original Author:: Scott Lininger 
#
# Tests the SketchUp Ruby API InputPoint object.
#
# This file was originally generated by ourdoc.rb, an internal tool we developed
# specifically for outputting support files (documentation, unit tests, etc.)
# from the standard, doxygen-style c++ comments that are embedded into the
# Ruby implementation files. You can find ourdoc.rb alongside these
# implementation files at:
#
# googleclient/sketchup/source/sketchup/ruby
#

require 'test/unit'

# TC_InputPoint contains unit tests for the InputPoint class.
#
# API Object::       InputPoint
# C++ File::         rinputpoint.cpp
# Parent Class::     Object
# Version::          SketchUp 6.0
#
# The InputPoint used to pick entities that reside under the current cursor
# location. InputPoint and PickHelper are similar, but InputPoint also uses
# inferencing.   Only tools react to cursor location. Therefore, most of the
# methods in this class are only useful in the context of a tool you are
# writing. For example, if you want to determine the entity that you just
# clicked on with the mouse, you would use InputPoint.pick from within your
# onLMouseButton method in a tool. See the example script linetool.rb for
# examples of using the InputPoint class.
#
#
class TC_InputPoint < Test::Unit::TestCase

  # Setup for test cases, if required.
  #
  def setup
    def UI::messagebox(params)
      puts 'TESTUP OVERRIDE: UI::messagebox > ' + params.to_s
    end
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    InputPoint.vertex
  # @file                rinputpoint.cpp
  #
  # The vertex method returns a Vertex associated with the InputPoint. If
  # the InputPoint is on the end of a line, then it will return the
  # Vertex. If the InputPoint does not select any vertices this method
  # returns nil.
  #
  #
  # Args:
  #
  # Returns:
  # - vertex: The associated vertex
  #

  # Test the example code that we have in the API documentation.
  def test_vertex_api_example
    assert_nothing_raised do
     view = Sketchup.active_model.active_view
     x = 100
     y = 100
     ip1 = view.inputpoint x,y
     # Click on a face and you get "On Face"
     tip = ip1.vertex
    end
  end

  # Test edgecases for values passed to this method.
  #def test_vertex_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_vertex_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_vertex_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    InputPoint.==
  # @file                rinputpoint.cpp
  #
  # The == method is used to determine if two input points are the same.
  #
  #
  # Args:
  # - inputpoint1: The first input point in the comparison.
  # - inputpoint2: The second input point in the comparison.
  #
  # Returns:
  # - status: true if the InputPoint objects are the same
  # object. False if the objects are not the same.
  #

  # Test the example code that we have in the API documentation.
  def test_equals_api_example
    assert_nothing_raised do
     view = Sketchup.active_model.active_view
     x = 100
     y = 100
     ip1 = Sketchup::InputPoint.new
     ip2 = view.inputpoint x,y
     # Copy the contents of inputpoint2 into inputpoint1
     ip1.copy! ip2
     # Returns true
     status = ip1 == ip2
    end
  end

  # Test edgecases for values passed to this method.
  #def test_equals_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_equals_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_equals_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    InputPoint.pick
  # @file                rinputpoint.cpp
  #
  # The pick method is used to get the input point at a specific screen
  # position.
  #
  # The first form just uses the screen position to compute the
  # InputPoint. It is used when you don't want the InputPoint to be
  # dependent on another InputPoint.
  #
  # The second form uses the screen position and another InputPoint. It
  # will find additional inferences such as along one of the axis
  # directions from the first point.
  #
  #
  # Args:
  # - view: The current view.
  # - x: A x value.
  # - y: A y value.
  # - inputpoint: A second input point used as a reference for the pick.
  #
  # Returns:
  # - status: true if a valid InputPoint was picked and it
  # is different than it was before.
  #

  # Test the example code that we have in the API documentation.
  def test_pick_api_example
    assert_nothing_raised do
     view = Sketchup.active_model.active_view
     x = 100
     y = 100
     inputpoint = view.inputpoint x, y
     inputpoint2 = Sketchup::InputPoint.new
     inputpoint.pick view, x, y
     inputpoint.pick view, x, y, inputpoint2
    end
  end

  # Test edgecases for values passed to this method.
  #def test_pick_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_pick_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_pick_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    InputPoint.degrees_of_freedom
  # @file                rinputpoint.cpp
  #
  # The degrees_of_freedom method retrieves the number of degrees of
  # freedom there are for an input point.
  #
  # If you are just getting a point in space, then the degrees_of_freedom
  # will be 3 - meaning that there is nothing about the point that would
  # constrain its position.
  #
  # If you are on a face, then the degrees_of_freedom will be 2 meaning
  # that you can only move on the plane of the face.
  #
  # If you are on an Edge or an axis, then the degrees_of_freedom will be
  # 1 meaning that you can only move in the direction of the edge or axis.
  #
  # If you get an end point of an Edge, or an intersection point, then
  # the degrees_of_freedom will be 0.
  #
  #
  # Args:
  #
  # Returns:
  # - degrees_of_freedom: see comments.
  #

  # Test the example code that we have in the API documentation.
  def test_degrees_of_freedom_api_example
    assert_nothing_raised do
     view = Sketchup.active_model.active_view
     x = 100
     y = 100
     ip1 = view.inputpoint x,y
     dof = ip1.degrees_of_freedom
    end
  end

  # Test edgecases for values passed to this method.
  #def test_degrees_of_freedom_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_degrees_of_freedom_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_degrees_of_freedom_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    InputPoint.valid?
  # @file                rinputpoint.cpp
  #
  # The valid? method is used to determine if an input point has valid
  # data.
  #
  # You must have called the pick method to set the data before it is
  # valid.
  #
  #
  # Args:
  #
  # Returns:
  # - status: true if the input point has valid data, false
  # if it does not have valid data.
  #

  # Test the example code that we have in the API documentation.
  def test_valid_api_example
    assert_nothing_raised do
     view = Sketchup.active_model.active_view
     x = 100
     y = 100
     ip1 = view.inputpoint x,y
     status = ip1.valid?
    end
  end

  # Test edgecases for values passed to this method.
  #def test_valid_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_valid_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_valid_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    InputPoint.depth
  # @file                rinputpoint.cpp
  #
  # The depth method retrieves the depth of an inference if it is coming
  # from a component.
  #
  # If the InputPoint is not getting a position from inside a component,
  # this method will return 0. Otherwise it returns the depth of the
  # entity in a nested component that is providing the position.
  #
  #
  # Args:
  #
  # Returns:
  # - depth: a number representing the depth of the
  # inputpoint (inside groups and components) if successful
  #

  # Test the example code that we have in the API documentation.
  def test_depth_api_example
    assert_nothing_raised do
     view = Sketchup.active_model.active_view
     x = 100
     y = 100
     ip1 = view.inputpoint x,y
     d = ip1.depth
    end
  end

  # Test edgecases for values passed to this method.
  #def test_depth_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_depth_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_depth_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    InputPoint.face
  # @file                rinputpoint.cpp
  #
  # The face method retrieves the face if the input point is getting its
  # position from a face.
  #
  # Otherwise it returns nil.
  #
  #
  # Args:
  #
  # Returns:
  # - face: a Face object if successful, or nil if
  # unsuccessful
  #

  # Test the example code that we have in the API documentation.
  def test_face_api_example
    assert_nothing_raised do
     view = Sketchup.active_model.active_view
     x = 100
     y = 100
     ip1 = view.inputpoint x,y
     f = ip1.face
    end
  end

  # Test edgecases for values passed to this method.
  #def test_face_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_face_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_face_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    InputPoint.tooltip
  # @file                rinputpoint.cpp
  #
  # The tooltip method is used to retrieve the string that is the tool tip
  # to display for the input point.
  #
  #
  # Args:
  #
  # Returns:
  # - tip: a string tooltip or an empty string (if the input
  # point doesn't provide a tooltip).
  #

  # Test the example code that we have in the API documentation.
  def test_tooltip_api_example
    assert_nothing_raised do
     view = Sketchup.active_model.active_view
     x = 100
     y = 100
     ip1 = view.inputpoint x,y
     # Click on a face and you get "On Face"
     tip = ip1.tooltip
    end
  end

  # Test edgecases for values passed to this method.
  #def test_tooltip_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_tooltip_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_tooltip_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    InputPoint.draw
  # @file                rinputpoint.cpp
  #
  # The draw method is used to draw the input point.
  #
  # This is useful for showing an InputPoint from within the draw method
  # of a tool that you have implemented in Ruby. Additional examples are
  # available in the Plugins/examples directory.
  #
  #
  # Args:
  # - view: The current view.
  #
  # Returns:
  # - : nil
  #

  # Test the example code that we have in the API documentation.
  def test_draw_api_example
    assert_nothing_raised do
     view = Sketchup.active_model.active_view
     x = 100
     y = 100
     ip1 = view.inputpoint x,y
     ip = ip1.draw view
    end
  end

  # Test edgecases for values passed to this method.
  #def test_draw_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_draw_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_draw_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    InputPoint.clear
  # @file                rinputpoint.cpp
  #
  # The clear method is used to clear the input point.
  #
  # This sets it to an empty state. After calling this, valid? will
  # return false.
  #
  #
  # Args:
  #
  # Returns:
  # - inputpoint: the cleared (empty) input point if this
  # successful
  #

  # Test the example code that we have in the API documentation.
  def test_clear_api_example
    assert_nothing_raised do
     view = Sketchup.active_model.active_view
     x = 100
     y = 100
     ip1 = view.inputpoint x,y
     # Returns true
     ip = ip1.clear
    end
  end

  # Test edgecases for values passed to this method.
  #def test_clear_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_clear_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_clear_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    InputPoint.new
  # @file                rinputpoint.cpp
  #
  # The new method is used to create a new InputPoint object.
  #
  #
  # Args:
  #
  # Returns:
  # - inputpoint: the newly created InputPoint object if
  # successful
  #

  # Test the example code that we have in the API documentation.
  def test_new_api_example
    assert_nothing_raised do
     ip1 = Sketchup::InputPoint.new
    end
  end

  # Test edgecases for values passed to this method.
  #def test_new_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_new_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_new_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    InputPoint.copy!
  # @file                rinputpoint.cpp
  #
  # The copy! method is used to copy the data from a second input point
  # into this input point.
  #
  #
  # Args:
  # - inputpoint: The second input point.
  #
  # Returns:
  # - inputpoint: the new input point that received the copy
  # if successful
  #

  # Test the example code that we have in the API documentation.
  def test_copy_inplace_api_example
    assert_nothing_raised do
     view = Sketchup.active_model.active_view
     x = 100
     y = 100
     ip1 = Sketchup::InputPoint.new
     ip2 = view.inputpoint x,y
     # Copy the contents of inputpoint2 into inputpoint1
     ip = ip1.copy! ip2
    end
  end

  # Test edgecases for values passed to this method.
  #def test_copy_inplace_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_copy_inplace_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_copy_inplace_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    InputPoint.edge
  # @file                rinputpoint.cpp
  #
  # The edge method is used to retrieve the edge if the input point is
  # getting its position from a point on an Edge.
  #
  #
  # Args:
  #
  # Returns:
  # - edge: an Edge object if successful, or nil if
  # unsuccessful
  #

  # Test the example code that we have in the API documentation.
  def test_edge_api_example
    assert_nothing_raised do
     view = Sketchup.active_model.active_view
     x = 100
     y = 100
     ip1 = view.inputpoint x,y
     e = ip1.edge
    end
  end

  # Test edgecases for values passed to this method.
  #def test_edge_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_edge_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_edge_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    InputPoint.display?
  # @file                rinputpoint.cpp
  #
  # The display? method is used to determine if the input point has
  # anything to draw.
  #
  # If the method returns true, then the draw method will draw something.
  #
  #
  # Args:
  #
  # Returns:
  # - status: true if the draw method will draw something,
  # false if the draw method has nothing to draw
  #

  # Test the example code that we have in the API documentation.
  def test_display_api_example
    assert_nothing_raised do
     view = Sketchup.active_model.active_view
     x = 100
     y = 100
     ip1 = view.inputpoint x,y
     status = ip1.display
    end
  end

  # Test edgecases for values passed to this method.
  #def test_display_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_display_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_display_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    InputPoint.transformation
  # @file                rinputpoint.cpp
  #
  # The transformation method retrieves the Transformation object for the
  # input point.
  #
  # If the InputPoint object is getting its position from something
  # inside of a component instance, this method returns the Transformation
  # of the component instance. Otherwise it returns the identity
  # Transformation.
  #
  # Note that the position method on a input point always returns a point
  # that is transformed into model space. If you are using the edge, face
  # or vertex method on the InputPoint though, you will probably need to
  # use the transformation method to transform the data that you get back
  # from the selected entity.
  #
  #
  # Args:
  #
  # Returns:
  # - transformation: the Transformation for the input point
  # if successful
  #

  # Test the example code that we have in the API documentation.
  def test_transformation_api_example
    assert_nothing_raised do
     view = Sketchup.active_model.active_view
     x = 100
     y = 100
     ip1 = view.inputpoint x,y
     # In this case, returning the identity transformation
     tform = ip1.transformation
    end
  end

  # Test edgecases for values passed to this method.
  #def test_transformation_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_transformation_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_transformation_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    InputPoint.position
  # @file                rinputpoint.cpp
  #
  # The position method is used to get the 3d point from the input point.
  #
  #
  # Args:
  #
  # Returns:
  # - point: a Point3d object position for the intput point
  # if successful
  #

  # Test the example code that we have in the API documentation.
  def test_position_api_example
    assert_nothing_raised do
     view = Sketchup.active_model.active_view
     x = 100
     y = 100
     ip1 = view.inputpoint x,y
     point = ip1.position
    end
  end

  # Test edgecases for values passed to this method.
  #def test_position_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_position_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_position_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

end
