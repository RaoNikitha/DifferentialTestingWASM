;; 9. Arrange `nop` instructions amidst variable `set` and `get` operations and stack-altering instructions (like `tee_local`) to ensure that stack integrity remains flawless, with `nop` showing complete transparency.

(assert_invalid
  (module (func $type-check (local $x i32) (local.set $x) (nop) (local.get $x) (nop) (drop)))
  "type mismatch"
)