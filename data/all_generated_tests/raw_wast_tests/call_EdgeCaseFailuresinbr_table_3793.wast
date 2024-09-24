;; 2. **Test: Br_Table with Out-of-Bound Index**    - **Description**: Create a `br_table` instruction where an index is out of bounds, followed by a `call` to a function that requires a specific type on the stack.    - **Constraint**: Confirm that an out-of-bounds index triggers the intended error or trap and that the stack state remains unchanged enough for the next `call` to consume the correct type.    - **Edge Case**: This checks if the index out-of-bound error is correctly handled without disrupting the stack operations preceding the `call`.

(assert_invalid
  (module
    (func $out_of_bounds_br_table (block $label (br_table 0 1 (i32.const 2))))
    (func $requires_param (param i32) (result i32) (local.get 0))
    (call $requires_param)
  )
  "invalid branch index"
)