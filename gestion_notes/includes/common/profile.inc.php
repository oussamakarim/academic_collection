<div class="col-md-6">
    <div class="profile" id="profile">
        <div class="triangle"></div>
        <div class="header">
            <span>Personal Information</span>
        </div>

        <div class="card">
            <span class="field-name">Username</span>
            <span class="filed-value"><?=$user->get_username();?></span>

            <span class="field-name">First Name</span>
            <span class="filed-value"><?=$user->get_first_name();?></span>

            <span class="field-name">Last Name</span>
            <span class="filed-value"><?=$user->get_last_name();?></span>

            <span class="field-name">Email</span>
            <input class="filed-value" value="<?=$user->get_email();?>" data-toggle='tooltip' title='Click To Update'></input>
        </div>

        <div class="footer">
            <button class="btn btn-info" data-toggle="modal" data-target="#myModal">Update password</button>
            <button class="btn btn-secondary">update email</button>
        </div>
    </div>
    <span id="update-message"></span>
</div>


<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Update password</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div class="input-group mt-3">
            <div class="input-group-prepend"><span class="input-group-text">password:</span></div>
            <input id="first-password" type="password" class="form-control" value="">
        </div>
        <div class="input-group mt-3">
            <div class="input-group-prepend"><span class="input-group-text">retype password</span></div>
            <input id="second-password" type="password" class="form-control" value="">
        </div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <span id="password-message"></span>
        <button id="update-password" type="button" class="btn btn-success" >Save</button>
        <button id="close-button" type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>