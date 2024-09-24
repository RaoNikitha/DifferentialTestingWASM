;; 2. Insert a `nop` instruction within a loop followed by a `br_if` condition that always evaluates to true. Test to confirm that the loop correctly branches on WebAssembly, but wizard_engine might interfere with intended loop behavior due to tracing.

(assert_invalid
  (module
    (func $test (loop (nop) (br_if 0 (i32.const 1))))
  )
  "expected type i32"
)