;; 5. Test a recursive function where `nop` is inserted before the `call` to itself and before each `return`, checking if the recursion and the resulting return value remain correct despite the `nop` instructions.

 ;; (module
  (func $recursive (param $n i32) (result i32)
    local.get $n
    i32.const 0
    i32.eq
    if (result i32)
      i32.const 1
    else
      local.get $n
      i32.const 1
      i32.sub
      nop
      call $recursive
      nop
      local.get $n
      i32.mul
    end)
  (func (export "test") (result i32)
    i32.const 5
    call $recursive)
)

(assert_invalid
  (module (func (result i32) (nop)))
  "type mismatch"
)