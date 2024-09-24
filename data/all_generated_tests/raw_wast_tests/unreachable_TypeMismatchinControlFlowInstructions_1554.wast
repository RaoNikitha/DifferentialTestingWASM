;; 5. **Test Description:**    - Use `unreachable` within a `block` that nests another `block` which in turn uses an `i64` value. The outer block expects an `i32` result.    - **Constraint Checked:** Verifies type compatibility in nested control flow structures with `unreachable`.    - **Relation to Type Mismatch:** Ensures nested instructions’ type checks do not conflict due to `unreachable`.

(assert_invalid
  (module 
    (func $type-nested-blocks-with-unreachable (result i32)
      (block (result i32)
        (block (result i64)
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)