;; 3. **Test Description:**    A sequence of `block` and `if` constructs with a series of interdependent `br_if` instructions based on a stack value comparison (e.g., equality check). Test should ensure `br_if` only branches when the condition is correctly true.    - **Constraint:** Tests condition correctness and result type matching in interdependent branches.

(assert_invalid
  (module
    (func $interdependent-br_if
      (block (result i32)
        (i32.const 0) 
        (i32.eqz)
        (if (result i32)
          (then
            (br_if 0 (i32.const 1))
          )
          (else
            (i32.const 2)
          )
        )
      )
      (drop)
    )
  )
  "type mismatch"
)