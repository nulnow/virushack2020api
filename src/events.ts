let events: any = {}

export const on: any = (event: any, handler: any) => {
    events = {
        ...events,
        [event]: events[event] ? [...events[event], handler] : [handler],
    }
}

export const off: any = (event: any, handler: any) => {
    events[event] = events[event].filter(h => h !== handler)
}

export const fire: any = (event: any, payload: any) => {
    // console.log('fire ' + event)
    events[event] && events[event].forEach(handler => handler(payload))
}

export const _reset: any = () => {
    events = {}
}
