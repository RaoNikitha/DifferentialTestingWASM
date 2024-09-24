;; 3. **Test Out-of-Bounds Global Access**:    - **Description**: Attempt to use a `call x` instruction that inadvertently attempts to access a global outside its defined range.    - **Constraint**: Validate that every global accessed by the called function is within bounds.    - **Relation to CFG**: Inconsistencies in CFG could lead to erroneous global accesses affecting call behavior.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (global $h (mut i32) (i32.const 1))
    (func $out-of-bounds-global ()
      global.get 2
      call $some_function
    )
    (func $some_function (param i32) (result i32)
      local.get 0
    )
  )
  "global index out of bounds"
)