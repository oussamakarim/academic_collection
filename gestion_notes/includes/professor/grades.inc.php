<?php 
    include_once(PHPPATH . 'GradesManager.php');
    $grade_manager = new GradesManager($user, $db);

    // get all classes an course from database
    $classes = $grade_manager->get_classes(); // array of classes (object)
    $classes_courses = array(); // assoc arr of courses (str => obj)
    $courses_grades = array();  // assoc arr of (str => assoc arr)
    foreach($classes as $class){
        $name = $class->get_name();
        $classes_courses[$name] = $grade_manager->get_courses_by_class($class);
    }
?>
<div id="grades" class="tab-pane fade" role="tab-panel">
<div class="row">
    <!-- side bar -->
    <div class="col-md-3 pt-3 sidebar">
      <div class="row">
          <input type="text" class="form-control searchbar" placeholder="search ..">
      </div>
        <ul>
        <?php 
           foreach($classes as $class){
               $class_name = $class->get_name();
               echo '<li data-toggle="collapse" data-target="#' . $class_name . '">' . $class_name . "</li>";
               echo '<ol id="' . $class_name . '" class="collapse">';
               
               foreach($classes_courses[$class->get_name()] as $course){
                    $course_name = $course->get_course_name();
                    $course_id = $course->get_id();

                    echo '<li id="' . $course_id . '">';
                    echo $course_name;
                    echo "</li>";
              }
               echo "</ol>";
           }
        ?>
        </ul>
    </div>

    <!-- grades input -->
    <div class="col-md p-4" id="grades_data">
           <!-- get value with ajax -->
           <div class="car w-50 bg-light border shadow-lg mx-auto">
             <div class="card-header">
               Select a class and course from the left side bar.
             </div>
           </div>
    </div>
</div>
</div>

<!-- update students input -->
<div class="modal" id="update">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Update Input</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div class="input-group mt-3">
            <div class="input-group-prepend"><span class="input-group-text">first test:</span></div>
            <input id="first-test" type="text" class="form-control" value="0">
        </div>
        <div class="input-group mt-3">
            <div class="input-group-prepend"><span class="input-group-text">last test:</span></div>
            <input id="second-test" type="text" class="form-control" value="0">
        </div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <span id="update-message"></span>
        <button id="update-grade" type="button" class="btn btn-success" >Save</button>
        <button id="close-button" type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>