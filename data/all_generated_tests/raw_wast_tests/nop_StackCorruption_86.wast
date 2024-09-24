;; 7. A combination of global variable access and `nop` instructions to ascertain that global state and operand stack semantics remain intact, detecting any inadvertent interaction between `nop` and global states.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $type-global (result i32)
      (global.set $g (i32.const 42))
      nop
      (global.get $g)))
  "type mismatch"
)