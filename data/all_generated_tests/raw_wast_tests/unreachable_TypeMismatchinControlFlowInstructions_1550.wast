;; 1. **Test Description:**    - Place `unreachable` inside a `block` that expects an `i32` type value on its stack and return the value from the `block`. Validate if the `block` type is mismatched.    - **Constraint Checked:** Ensures that the `block` instruction properly checks for the expected input and output types even with the stack-polymorphic nature of `unreachable`.    - **Relation to Type Mismatch:** Verifies the type conformity of control flow instructions when `unreachable` is present.

(assert_invalid
  (module (func $type-block-return-num-vs-void-unreachable (result i32)
    (block (result i32) (unreachable) (i32.const 1))
  ))
  "type mismatch"
)