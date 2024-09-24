;; 4. **Test Description:** Use `unreachable` in a try-catch block, followed by instructions that might raise exceptions. This evaluates how the CFG processes exceptions and traps, ensuring that traps within try-catch blocks are consistently managed.    - **Constraint:** Immediate trap should prevent further exception handling.    - **Relation to CFG:** Examines CFG's consistency in exception and trap handling.

(assert_invalid
  (module (func $try_unreachable
    (try 
      (do (unreachable)) 
      (catch_all (i32.const 1))
    )
  ))
  "type mismatch"
)