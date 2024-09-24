;; Create a scenario where a function is indirectly called without initializing the indirect call table properly. Observe if both implementations can handle the indirect function call or if one traps incorrectly due to improper table lookup.

(assert_invalid
  (module
    (type (func))
    (table 0 funcref)
    (func $type-no-init-table (call_indirect (type 0) (i32.const 0)))
  )
  "element segment does not fit"
)