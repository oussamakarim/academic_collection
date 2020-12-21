<div class="offset-md-1 col-md-4 offset-md-1">
    <div class="publish">
  <div class="head">
    <h1>&lt; Publier /&gt;</h1>
    <p class="text-secondary">Publish files for every students in your classes.</p>
  </div>
  <div class="body">
    <div class="half1">
      <select name="class" id="class">
        <option value="01">--Classe--</option>

        <?php 
          foreach($classes as $class){
            echo '<option value="' . $class->get_id() . '">' . $class->get_name() . "</option>";
          }
        ?>
      </select>
      
      <select name="course" id="course">
        <option value="01">--Course--</option>
        <?php 
           foreach($classes as $class){
               $class_name = $class->get_name();               
               foreach($classes_courses[$class->get_name()] as $course){
                    $course_name = $course->get_course_name();
                    $course_id = $course->get_id();
                    echo '<option value="' . $course_id . '">' . $course_name . '</option>';
              }
               echo "</ol>";
           }
        ?>
      </select>
      
      
      <form>
        <div class="custom-file">
        <input type="file" class="custom-file-input" id="customFile">
        <label class="custom-file-label" for="customFile">Choose a file</label>
      </div>
      </form>
    </div>
    <div class="half2">
      <h4>Uploaded file</h4>
      <ul class="list-group list-group-flush">
        <li class="list-group-item"><a href="./foo.pdf">Calendrier 2019/2012.pdf</a></li>
        <li class="list-group-item"><a href="./foo.pdf">Correction Controle01.pdf</a></li>
        <li class="list-group-item"><a href="./foo.pdf">Liste rattrapage.xsl</a></li>
        <li class="list-group-item"><a href="./foo.pdf">conrole session normale.pdf</a></li>
        <li class="list-group-item"><a href="./foo.pdf">session ratt.pdf</a></li>
        <!-- <li class="list-group-item">item 02</li>
        <li class="list-group-item">item 03</li>
        <li class="list-group-item">item 04</li>
        <li class="list-group-item">item 05</li> -->
      </ul>
    </div>
  </div>
                      
                      
  <div class="footer">
    <button class="btn btn-info">Upload</button>
  </div>
</div>
</div>
