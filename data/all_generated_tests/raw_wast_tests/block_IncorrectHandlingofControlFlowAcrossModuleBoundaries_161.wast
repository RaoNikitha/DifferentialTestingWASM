;; 2. Create two modules: one exporting a function containing a `block` that calls back to the original module, which contains a `block` with a `br_if` instruction. Check if the jump correctly returns control post `block`.

(assert_invalid
  (module
    (import "env" "callback" (func $callback))
    (func $test (result i32)
      (block $outer (result i32)
        call $callback
        (block $inner
          i32.const 1
          i32.const 0
          br_if 0
          i32.const 42
          return
        )
        i32.const 99
      )
    )
    (export "test" (func $test))
  )
)