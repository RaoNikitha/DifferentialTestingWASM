;; 6. Develop a WebAssembly function where a recursive call ultimately reaches an `unreachable` instruction to see if the trap is correctly triggered in a recursive context.

(assert_invalid
  (module
    (func $recursive_unreachable (result i32)
      (local $x i32)
      (local.set $x (i32.const 0))
      (block
        (loop
          (br_if 1 (i32.eq (local.get $x) (i32.const 1)))
          (local.set $x (i32.add (local.get $x) (i32.const 1)))
          (call $recursive_unreachable)
        )
        (unreachable)
      )
    )
  )
  "type mismatch"
)