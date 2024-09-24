;; 1. **Test Description: Invalid Function Index in `call_indirect`:**    - Create a `br_table` instruction within a function, and follow it with a `call_indirect` to a function index that's out of bounds.    - **Constraint Checked:** Ensures that the improper handling of the `call_indirect` with an invalid index correctly falls to the default label.    - **Relation to Incorrect Function Call:** This checks if the indirect function call jumps to an unintended default execution path.

(assert_invalid
  (module
    (type $t (func (param i32) (result i32)))
    (func $f
      (block
        (block
          (br_table 0 1 (i32.const 5))
          (call_indirect (type $t) (i32.const 0) (i32.const 999))
        )
      )
    )
  )
  "unknown function"
)