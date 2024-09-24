;; Implement a WebAssembly module where indirect calls are part of exception handling routines, verifying that the CFG correctly maps paths involving control flow divergences due to exceptions.

(assert_invalid
  (module
    (type (func))
    (type (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $throw)
    (func $throw (type 0)
      (throw $exn)
    )
    (func $main (param i32) (result i32)
      (try (result i32)
        (do
          (call_indirect (type 1) (local.get 0))
        )
        (catch $exn
          (i32.const 0)
        )
      )
    )
    (exception $exn)
  )
  "type mismatch"
)