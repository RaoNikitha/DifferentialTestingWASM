;; 4. **Test Description**: Create a simple block containing a `br_table` instruction with multiple targets, leading to different sections of the code, some of which contain `unreachable` instructions. This will test proper target selection and operand stack handling without reaching the `unreachable` instruction unintentionally.

(assert_invalid
  (module (func $br_table_unreachable (result i32)
    (block (result i32)
      (block (result i32)
        (i32.const 0)
        (br_table 0 1 (unreachable))
      )
    )
  ))
  "type mismatch"
)