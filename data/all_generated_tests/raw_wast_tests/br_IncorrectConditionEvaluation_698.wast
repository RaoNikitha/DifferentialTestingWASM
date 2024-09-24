;; 9. **Test Description:**    Nested `block`s where the outer block contains a `br_if` with a condition on the sum of stack values, and the inner block contains actual value computations. Test should verify if `br_if` evaluates the sum condition correctly and branches as expected.    - **Constraint:** Tests correct conditional branching based on complex stack computations.

(assert_invalid
  (module 
    (func $complex-stack-sum (param i32 i32) 
      (block (result i32)
        (block (result i32)
          (i32.add (local.get 0) (local.get 1))
          (br_if 1)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)