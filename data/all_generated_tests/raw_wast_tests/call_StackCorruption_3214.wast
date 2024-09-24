;; 3. Implement a nested `call` instruction that involves multiple function calls with varying argument counts, checking for stack consistency after each call and on completion.

(assert_invalid
  (module
    (func $nested-call (call 1 (i32.const 1)) (call 2 (i32.const 1) (f64.const 1)) (call 3 (i32.const 2)))
    (func (param i32))
    (func (param i32 f64))
    (func (param f64))
  )
  "type mismatch"
)