;; 8. **Test Reset Context for Delayed Unreachable**:    - Create a context requiring multiple branches (using `br`) with unreachable at the end of an `if-else` construct. Test if control flow erroneously reaches `unreachable` without reset.

(assert_invalid
  (module
    (func $reset-context-delayed-unreachable
      (block
        (br 0)
        (if (i32.const 1) 
          (then) 
          (else
            (unreachable)
          )
        )
      )
    )
  )
  "type mismatch"
)