Getter __FILE__ do

  setup \
    base: :commits,
    fields: [:hash, :time, :status],
    order: [ [field('time').cast(:timestamp), false] ],
    limit: false,

    scope: ->(ds, params){ ds.where(field('status')=>'accepted') }

end
