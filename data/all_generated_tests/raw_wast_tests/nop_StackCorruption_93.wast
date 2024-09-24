;; 4. **Test Description**: Use a function call that passes multiple arguments, interspersed with `nop` instructions, to verify the integrity of the stack when arguments are pushed and popped around the `nop` instruction. Ensure all function arguments remain intact.

(assert_invalid
  (module
    (func $foo (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
      (local.get $0)
      (nop)
      (local.get $1)
      (nop)
      (local.get $2)
      (nop)
      (local.get $3)
    )
  )
  "type mismatch"
)