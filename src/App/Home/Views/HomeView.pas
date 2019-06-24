(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit HomeView;

interface

{$MODE OBJFPC}
{$H+}

uses

    fano;

type

    (*!-----------------------------------------------
     * View instance
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    THomeView = class(TInjectableObject, IView)
    private
        fHtml : string;
    public
        constructor create(const htmlFile : string);

        (*!------------------------------------------------
         * render view
         *------------------------------------------------
         * @param viewParams view parameters
         * @param response response instance
         * @return response
         *-----------------------------------------------*)
        function render(
            const viewParams : IViewParameters;
            const response : IResponse
        ) : IResponse;
    end;

implementation

uses

    StringFileReaderImpl;

    constructor THomeView.create(const htmlFile : string);
    var fileReader : IFileReader;
    begin
        fileReader := TStringFileReader.create();
        fHtml := fileReader.readFile(htmlFile);
    end;

    (*!------------------------------------------------
     * render view
     *------------------------------------------------
     * @param viewParams view parameters
     * @param response response instance
     * @return response
     *-----------------------------------------------*)
    function THomeView.render(
        const viewParams : IViewParameters;
        const response : IResponse
    ) : IResponse;
    begin
        response.body().write(fHtml);
        result := response;
    end;

end.
