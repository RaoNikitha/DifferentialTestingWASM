;; 1. **Test 1**:    - **Description**: A `block` instruction expecting a `f64` type result, followed by a `br_if` that unwinds the stack by popping an `i32` value and provides an `f64` value.    - **Constraint**: Checks whether the `br_if` correctly matches the `block`'s expected result type (`f64`).    - **Relation to Type Mismatch**: This tests type adherence when the `br_if` operand type differs from the `block`'s expected type.

(assert_invalid
 (module (func $type-mismatch-br_if (result f64)
   (block (result f64)
     (drop (br_if 0 (i32.const 1) (f64.const 0.0))) (f64.const 1.0)
   )
 ))
 "type mismatch"
)