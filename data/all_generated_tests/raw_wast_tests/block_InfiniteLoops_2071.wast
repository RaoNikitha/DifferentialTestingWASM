;; 2. **Test Description:**    A block inside a loop with multiple `br` instructions targeting the block's label and never allowing the loop to terminate.      **Constraint Checked:** Proper label indexing and branch handling.      **Relation to Infinite Loops:** Ensures that branches handle the stack and continue execution correctly, preventing a permanent loop.

(assert_invalid
  (module (func $infinite-loop-with-br
    (loop (block $label (br $label) (br $label) (br 1)))
  ))
  "unreachable code should not validate"
)