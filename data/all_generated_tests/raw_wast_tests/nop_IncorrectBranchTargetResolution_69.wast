;; Add `nop` inside complex branching scenarios involving nested `block`, `loop`, and `select` instructions to verify that `br`, `br_if`, and `br_table` branches resolve correctly without `nop` causing incorrect control flow in either implementation.

(assert_invalid
  (module
    (func
      (block (nop) (block (loop (if (then (nop) (br 2)))))
      (select (i32.const 0) (i32.const 1) (nop))))
  "type mismatch")