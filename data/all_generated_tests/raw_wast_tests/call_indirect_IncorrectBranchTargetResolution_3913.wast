;; 2. Create a WebAssembly module where `call_indirect` targets functions with different types and includes an indirect call followed by a `br` instruction that erroneously jumps to the beginning of an outermost block instead of the intended block due to improper signature handling.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param f64) (result i32)))
    (table 2 funcref)
    (elem (i32.const 0) $f1 $f2)
    (func $f1 (type $sig1) (param i32) (result i32) (i32.add (local.get 0) (i32.const 1)))
    (func $f2 (type $sig2) (param f64) (result i32) (i32.trunc_f64_s (local.get 0)))
    (func $caller
      (block $outer
        (block $inner
          (call_indirect (type $sig1) (i32.const 0) (i32.const 42))
          (br $outer)
        )
      )
    )
  )
  "type mismatch"
)