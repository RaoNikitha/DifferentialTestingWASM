;; 2. **Test Description**:    - Implement a loop construct which contains a `call` instruction to a function `F1`.    - `F1` further calls another function `F2` using another `call` inside its body.    - Introduce branches inside the loop that jump out to labels defined after the loop, ensuring this happens just before and after the `call` instructions.    - **Constraint Checked**: Integrity of function calls and returns in the presence of loops and branches.    - **Incorrect Branch Target Resolution**: Mis-resolved branches lead to skipping `call` executions or jumping to incorrect labels causing wrong function call behavior.

(assert_invalid
  (module
    (func $F2 (nop))
    (func $F1 
      (call $F2)
    )
    (func $test 
      (loop $loop 
        (br $afterLoop) 
        (call $F1) 
        (br $afterLoop)
      ) 
      $afterLoop
    )
  )
  "type mismatch"
)