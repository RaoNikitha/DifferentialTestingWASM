;; 3. Design an `if` conditional that leads to different branches, with one branch containing the `unreachable` followed by an `i32.add`, to test whether type checking is enforced in unreachable blocs of conditionals.

(assert_invalid
  (module (func $differential-test-if-branch
    (i32.const 1) 
    (if (then (unreachable) (i32.add)))
  ))
  "type mismatch"
)