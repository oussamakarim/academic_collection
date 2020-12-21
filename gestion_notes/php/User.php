<?php


interface User {
    public function get_id();
    public function get_username();
    public function get_first_name();
    public function get_last_name();
    public function get_email();

    public function update_username($username);
    public function update_first_name($first_name);
    public function update_last_name($last_name);
    public function update_email($email);
}

class Professor implements User {
    public function __construct($userid, $db){
        $this->userid = $userid;
        $this->db = $db;

        $stmt = $this->db->prepare("select username, first_name, last_name, email from professors where id = ?");
        $stmt->bindValue(1, $this->userid);
        $stmt->execute();
        $query_result = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($query_result){
            $this->username = $query_result['username'];
            $this->first_name = $query_result['first_name'];
            $this->last_name = $query_result['last_name'];
            $this->email = $query_result['email'];
        } else {
            die("Could not get user information from database");
        }
    }
    public function get_id(){return $this->userid;}
    public function get_username(){return $this->username;}
    public function get_first_name(){return $this->first_name;}
    public function get_last_name(){return $this->last_name;}
    public function get_email(){return $this->email;}

    public function update_username($username) {
        if (preg_match("/^\w{3,15}$/", $username)){
            $stmt = $this->db->prepare("update professors set username = ? where id = ?;");
            $stmt->bindValue(1, $username);
            $stmt->bindValue(2, $this->userid);
            if ($stmt->execute()){
                $this->username = $username;
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public function update_first_name($first_name){
        if (preg_match("/^[a-zA-Z]{3,20}$/", $first_name)){
            $stmt = $this->db->prepare("update professors set first_name = ? where id = ? ;");
            $stmt->bindValue(1, $first_name);
            $stmt->bindValue(2, $this->userid);
            if ($stmt->execute()){
                $this->first_name = $first_name;
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
    public function update_last_name($last_name) {
        if (preg_match("/^[a-zA-Z]{3,20}$/", $last_name)){
            $stmt = $this->db->prepare("update professors set last_name = ? where id = ? ;");
            $stmt->bindValue(1, $last_name);
            $stmt->bindValue(2, $this->userid);
            if ($stmt->execute()){
                $this->last_name = $last_name;
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
    public function update_email($email) {
        if (preg_match("/^\w{4,20}@[a-zA-Z]{3,7}\.[a-z]{2,5}$/", $email)){
            $stmt = $this->db->prepare("update professors set email = ? where id = ? ;");
            $stmt->bindValue(1, $email);
            $stmt->bindValue(2, $this->userid);
            if ($stmt->execute()){
                $this->email = $email;
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
}

class Student implements User {
    public function __construct($userid, $db){
        $this->userid = $userid;
        $this->db = $db;

        $stmt = $this->db->prepare("select username, first_name, last_name, email from students where id = ?");
        $stmt->bindValue(1, $this->userid);
        $stmt->execute();
        $query_result = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($query_result){
            $this->username = $query_result['username'];
            $this->first_name = $query_result['first_name'];
            $this->last_name = $query_result['last_name'];
            $this->email = $query_result['email'];
        } else {
            die("Could not get user information from database");
        }
    }

    public function get_id(){return $this->userid;}
    public function get_username(){return $this->username;}
    public function get_first_name(){return $this->first_name;}
    public function get_last_name(){return $this->last_name;}
    public function get_email(){return $this->email;}

    public function update_username($username) {
        if (preg_match("/^\w{3,15}$/", $username)){
            $stmt = $this->db->prepare("update students set username = ? where id = ?;");
            $stmt->bindValue(1, $username);
            $stmt->bindValue(2, $this->userid);
            if ($stmt->execute()){
                $this->username = $username;
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public function update_first_name($first_name){
        if (preg_match("/^[a-zA-Z]{3,20}$/", $first_name)){
            $stmt = $this->db->prepare("update students set first_name = ? where id = ? ;");
            $stmt->bindValue(1, $first_name);
            $stmt->bindValue(2, $this->userid);
            if ($stmt->execute()){
                $this->first_name = $first_name;
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
    public function update_last_name($last_name) {
        if (preg_match("/^[a-zA-Z]{3,20}$/", $last_name)){
            $stmt = $this->db->prepare("update students set last_name = ? where id = ? ;");
            $stmt->bindValue(1, $last_name);
            $stmt->bindValue(2, $this->userid);
            if ($stmt->execute()){
                $this->last_name = $last_name;
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
    public function update_email($email) {
        if (preg_match("/^\w+@\w+\.\w{2,5}$/", $email)){
            $stmt = $this->db->prepare("update students set email = ? where id = ? ;");
            $stmt->bindValue(1, $email);
            $stmt->bindValue(2, $this->userid);
            if ($stmt->execute()){
                $this->email = $email;
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
}

?>