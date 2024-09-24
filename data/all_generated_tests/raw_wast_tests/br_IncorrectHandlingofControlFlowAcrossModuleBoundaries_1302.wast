;; 3. **Test Description 3**:    Have a `loop` in a WASM module call an exported function from another module. Inside the called function, use a `br` instruction to attempt a backward branch to the `loop`. Ensure the loop correctly continues without stack corruption.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func (export "loop_with_br")
      (loop
        (call $external_func)
        (br 0)
      )
    )
  )
  "unexpected call depth"
)